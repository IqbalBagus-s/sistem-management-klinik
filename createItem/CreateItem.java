import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.HashSet;
import java.util.Set;

public class CreateItem extends JFrame {
    private JTextField itemNameField, descriptionField, sellPriceField, buyPriceField, qtyField;
    private DefaultTableModel tableModel;
    private int nextId = 1;
    private Set<Integer> availableIds = new HashSet<>();

    public CreateItem() {
        setTitle("Create Item");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        JPanel inputPanel = new JPanel();
        inputPanel.setLayout(new GridLayout(6, 2, 10, 10));
        inputPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        inputPanel.setBackground(new Color(50, 0, 100));

        JLabel itemIdLabel = new JLabel("Item id");
        itemIdLabel.setForeground(Color.WHITE);
        JLabel itemIdValue = new JLabel(getNextItemId());
        itemIdValue.setForeground(Color.WHITE);

        JLabel itemNameLabel = new JLabel("Item Name");
        itemNameLabel.setForeground(Color.WHITE);
        itemNameField = new JTextField();

        JLabel descriptionLabel = new JLabel("Description");
        descriptionLabel.setForeground(Color.WHITE);
        descriptionField = new JTextField();

        JLabel sellPriceLabel = new JLabel("SellPrice");
        sellPriceLabel.setForeground(Color.WHITE);
        sellPriceField = new JTextField();

        JLabel buyPriceLabel = new JLabel("BuyPrice");
        buyPriceLabel.setForeground(Color.WHITE);
        buyPriceField = new JTextField();

        JLabel qtyLabel = new JLabel("Qty");
        qtyLabel.setForeground(Color.WHITE);
        qtyField = new JTextField();

        inputPanel.add(itemIdLabel);
        inputPanel.add(itemIdValue);
        inputPanel.add(itemNameLabel);
        inputPanel.add(itemNameField);
        inputPanel.add(descriptionLabel);
        inputPanel.add(descriptionField);
        inputPanel.add(sellPriceLabel);
        inputPanel.add(sellPriceField);
        inputPanel.add(buyPriceLabel);
        inputPanel.add(buyPriceField);
        inputPanel.add(qtyLabel);
        inputPanel.add(qtyField);

        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new GridLayout(1, 4, 10, 10));
        buttonPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        buttonPanel.setBackground(new Color(50, 0, 100));

        JButton addButton = new JButton("Add");
        JButton updateButton = new JButton("Update");
        JButton deleteButton = new JButton("Delete");
        JButton exitButton = new JButton("Exit");

        buttonPanel.add(addButton);
        buttonPanel.add(updateButton);
        buttonPanel.add(deleteButton);
        buttonPanel.add(exitButton);

        String[] columnNames = {"Itemno", "Item Name", "Description", "SellPrice", "BuyPrice", "Qty"};
        tableModel = new DefaultTableModel(columnNames, 0);
        JTable table = new JTable(tableModel);
        JScrollPane scrollPane = new JScrollPane(table);

        add(inputPanel, BorderLayout.NORTH);
        add(buttonPanel, BorderLayout.SOUTH);
        add(scrollPane, BorderLayout.CENTER);

        setVisible(true);

        exitButton.addActionListener(e -> System.exit(0));

        addButton.addActionListener(e -> {
            String itemId = itemIdValue.getText();
            String itemName = itemNameField.getText();
            String description = descriptionField.getText();
            String sellPriceText = sellPriceField.getText();
            String buyPriceText = buyPriceField.getText();
            String qty = qtyField.getText();

            try {
                double sellPrice = Double.parseDouble(sellPriceText);
                double buyPrice = Double.parseDouble(buyPriceText);

                if (sellPrice <= buyPrice) {
                    JOptionPane.showMessageDialog(this, "Sell Price must be higher than Buy Price", "Input Error", JOptionPane.ERROR_MESSAGE);
                } else {
                    tableModel.addRow(new Object[]{itemId, itemName, description, sellPrice, buyPrice, qty});
                    itemIdValue.setText(getNextItemId());
                    clearFields();
                }
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(this, "Please enter valid numbers for Sell Price and Buy Price", "Input Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        deleteButton.addActionListener(e -> {
            int selectedRow = table.getSelectedRow();
            if (selectedRow != -1) {
                String itemId = tableModel.getValueAt(selectedRow, 0).toString();
                tableModel.removeRow(selectedRow);
                availableIds.add(Integer.parseInt(itemId.substring(2)));
                itemIdValue.setText(getNextItemId());
            }
        });

        updateButton.addActionListener(e -> {
            int selectedRow = table.getSelectedRow();
            if (selectedRow != -1) {
                String itemName = itemNameField.getText();
                String description = descriptionField.getText();
                String sellPriceText = sellPriceField.getText();
                String buyPriceText = buyPriceField.getText();
                String qty = qtyField.getText();

                try {
                    double sellPrice = Double.parseDouble(sellPriceText);
                    double buyPrice = Double.parseDouble(buyPriceText);

                    if (sellPrice <= buyPrice) {
                        JOptionPane.showMessageDialog(this, "Sell Price must be higher than Buy Price", "Input Error", JOptionPane.ERROR_MESSAGE);
                    } else {
                        tableModel.setValueAt(itemName, selectedRow, 1);
                        tableModel.setValueAt(description, selectedRow, 2);
                        tableModel.setValueAt(sellPrice, selectedRow, 3);
                        tableModel.setValueAt(buyPrice, selectedRow, 4);
                        tableModel.setValueAt(qty, selectedRow, 5);
                    }
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(this, "Please enter valid numbers for Sell Price and Buy Price", "Input Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
    }

    private String getNextItemId() {
        if (!availableIds.isEmpty()) {
            int id = availableIds.iterator().next();
            availableIds.remove(id);
            return String.format("IU%03d", id);
        }
        return String.format("IU%03d", nextId++);
    }

    private void clearFields() {
        itemNameField.setText("");
        descriptionField.setText("");
        sellPriceField.setText("");
        buyPriceField.setText("");
        qtyField.setText("");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(CreateItem::new);
    }
}
